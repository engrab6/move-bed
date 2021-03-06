#include "./lbm/Domain.h"
#include <time.h>

struct myUserData
{
    std::ofstream oss_ss;
    double g;
    double nu;
    double R;
    int Ny;
    double gap;
    double rhos;
    Vec3_t g0;
};


void Initial(LBM::Domain &dom, void *UD)
{
    myUserData &dat = (*static_cast<myUserData *> (UD));
    size_t nx = dom.Ndim(0);
    size_t ny = dom.Ndim(1);

    double py = dat.Ny*2*dat.R + (dat.Ny-1)*dat.gap;
    double H = ((double) ny-1) - py;
    std::cout<<"max vel "<<dat.g/(2.0*dat.nu)*H*H/4.0<<std::endl;
    for(size_t ix=0; ix<nx; ++ix)
    for(size_t iy=0; iy<ny; ++iy)
    {
        if(iy<py)
        {
            Vec3_t vtemp(0, 0, 0);
            // Vec3_t vtemp((double) dat.vb, 0, 0);
            dom.Rho[ix][iy][0] = 1.0;
            dom.Vel[ix][iy][0] = vtemp;
            dom.BForce[ix][iy][0] = dat.g0;
            for(size_t k=0; k<dom.Nneigh; ++k)
            {
                dom.F[ix][iy][0][k] = dom.Feq(k,1.0,vtemp);            
                dom.Ftemp[ix][iy][0][k] = dom.Feq(k,1.0,vtemp);            
            }
        }else{
            double yy = (double) iy;
            double uy = dat.g/(2.0*dat.nu)*(H*(yy-py) - (yy-py)*(yy-py)); 
            Vec3_t vtemp(uy, 0, 0);
            // Vec3_t vtemp((double) dat.vb, 0, 0);
            dom.Rho[ix][iy][0] = 1.0;
            dom.Vel[ix][iy][0] = vtemp;
            dom.BForce[ix][iy][0] = dat.g0;
            for(size_t k=0; k<dom.Nneigh; ++k)
            {
                dom.F[ix][iy][0][k] = dom.Feq(k,1.0,vtemp);            
                dom.Ftemp[ix][iy][0][k] = dom.Feq(k,1.0,vtemp);            
            }
        }
        

    }
}



double random(double a, double b)
{
    double rn = std::rand()/((double) RAND_MAX);
    return (b-a)*rn+a;
}
  
int main (int argc, char **argv) try
{
    
    std::srand((unsigned)time(NULL));    
    size_t Nproc = 12;
    int Nx = 100;
    int Ny = 50;
    size_t Rn = 10;
    double gap = 0.0;
    double nu = 0.01;
    double ratio = 0.001;
    if(argc>=2) Nproc = atoi(argv[1]);
    if(argc>=3) ratio = atof(argv[2]);
    
    int gapn = std::ceil(gap*Nx);
    std::cout<<"extra gap n "<<gapn<<std::endl;
    size_t nx = 2*Rn*Nx+gapn;
    size_t ny = Rn*Nx;
    size_t nz = 1;
    double dx = 1.0;
    double dt = 1.0;
    double R = (double) Rn;
    double Ga = 10.0;
    double rho = 1.0;
    double rhos = 2.0;
    double gy = Ga*Ga*nu*nu/((8*R*R*R)*(rhos/rho-1));
    std::cout<<"gy = "<<gy<<std::endl;

    std::cout<<"R = "<<R<<std::endl;
    //nu = 1.0/30.0;
    std::cout<<nx<<" "<<ny<<" "<<nz<<std::endl;
    LBM::Domain dom(D2Q9,MRT, nu, iVec3_t(nx,ny,nz),dx,dt);
    myUserData my_dat;
    dom.UserData = &my_dat;
    my_dat.nu = nu;
    my_dat.g = -gy*ratio;
    my_dat.R = R;
    my_dat.gap = gap;
    my_dat.Ny = Ny;
    Vec3_t g0(my_dat.g,0.0,0.0);
    my_dat.g0 = g0;
    std::cout<<"gx = "<<my_dat.g<<std::endl;
    dom.Nproc = Nproc;       

    //initial
    
    my_dat.rhos = rhos;
    
    
    Vec3_t pos(R+gap,R,0.0);
    Vec3_t dxp(0.0,0.0,0.0);
    Vec3_t v(0.0,0.0,0.0);
    Vec3_t w(0.0,0.0,0.0);
    //DEM
    dom.dtdem = 0.01*dt;
    int pnum = 0;
    //fixed
    for(int ip=0; ip<Nx; ++ip)
    {
        // std::cout<<pos<<std::endl;
        dom.Particles.push_back(DEM::Disk(pnum, pos, v, w, rhos, R, dom.dtdem));
        dom.Particles[ip].FixVeloc();
        dxp = 2.0*R+gap,0.0,0.0;
        pos = pos+dxp;
        pnum++;
    }
    //move
    for(int ipy=0; ipy<Ny; ++ipy)
    {
        pos = R+gap,(2*ipy+3)*R+gap,0.0;
        for(int ipx=0; ipx<Nx; ++ipx)
        {
            Vec3_t dxr(random(-0.1,0.1),random(-0.1,0.1),0.0);
            // Vec3_t dxr(0.0,0.0,0.0);
            dom.Particles.push_back(DEM::Disk(-pnum, pos+dxr, v, w, rhos, R, dom.dtdem));
            // std::cout<<pos(0)<<" "<<pos(1)<<std::endl;
            dxp = 2.0*R+gap,0.0,0.0;
            pos = pos+dxp;
            pnum++;
        }   
    }

    std::cout<<"Particles number = "<<dom.Particles.size()<<std::endl;
    
    for(int ip=0; ip<(int) dom.Particles.size(); ++ip)
    {
        dom.Particles[ip].Ff = 0.0, -M_PI*R*R*rhos*gy, 0.0;
        dom.Particles[ip].Kn = 5;
        dom.Particles[ip].Gn = 0.8;
        dom.Particles[ip].Kt = 2.5;
        // dom.Particles[ip].Mu = 0.0;
        // dom.Particles[ip].Eta = 0.0;
        // dom.Particles[ip].Beta = 0.0;
        dom.Particles[ip].Rh = 0.8*R;
        // dom.Particles[ip].FixVeloc();

    }
    
    

    Vec3_t v0(0.0,0.0,0.0);
    dom.IsF = true;
    
    // dom.InitialFromH5(h5name,g0);
    dom.Initial(rho,v0,g0);
    // Initial(dom, dom.UserData);


    double Tf = 2;
    
    double dtout = 1;
    dom.Box = 0.0,(double) nx-1, 0.0;
    dom.modexy = 0;
    //solving
    dom.SolveIBM( Tf, dtout, "test_mvbed_c", NULL, NULL);
    
    return 0;
}MECHSYS_CATCH