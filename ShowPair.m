clear
clc
prefix = '/home/pzhang/chen/move-bed/';
middle = 'test_periodic_';
for i = 10:10
name = strcat(prefix,middle,num2str(i,'%04d'),'.h5');
pos = h5read(name,'/Pposition');
Np = 5;
ii = 1:Np*2;
Pos = [pos(3*(ii-1)+1),pos(3*(ii-1)+2),pos(3*(ii-1)+3)];
ptag = h5read(name,'/PTag');
% plist = h5read(name,'/PList');
num = 0;
color = {'r','g'};
subplot(121)
for j=1:Np*2
    if(ptag(j)>0)
        viscircles(Pos(j,1:2),20,'color',char(color(ceil(j/100))));
        hold on
        plot(Pos(j,1),Pos(j,2),'b.')
        if(j<=100)
            text(Pos(j,1),Pos(j,2),num2str(j-1));
        else
            text(Pos(j,1),Pos(j,2),num2str(j-1-100));
        end
        num = num +1;
    end
end
for j=1:2:numel(plist)-1
    k = [plist(j),plist(j+1)]+1;
    
    plot(Pos(k,1),Pos(k,2),'b')
end

plot([0 0],[0 500],'k','linewidth',2)
plot([40 40],[0 500],'k--','linewidth',2)
plot([399 399],[0 500],'k','linewidth',2)
plot([359 359],[0 500],'k--','linewidth',2)
title(i)
hold off
subplot(122)
ii = 1:numel(plist)/2;
Plist = [plist(2*(ii-1)+1),plist(2*(ii-1)+2)];
sp = size(Plist)
llist=[];
for j=1:sp(1)
    k1 = Plist(j,1)+1;
    k2 = Plist(j,2)+1;
    flag1= false;
    flag2= false;
    
    if(ptag(k1+100)<0 && ptag(k2+100)<0)
        flag1 = norm(Pos(k1,:)-Pos(k2,:))<40;
    elseif(ptag(k1+100)>0)
        flag2 = norm(Pos(k1+100,:)-Pos(k2,:))<40;
    elseif(ptag(k2+100)>0)
        flag2 = norm(Pos(k1,:)-Pos(k2+100,:))<40;
    end
    if(flag1||flag2)
        plot(Plist(j,1),Plist(j,2),'b*')
        hold on
        llist=[llist;[k1,k2]-1];
    end
end

list = [];
for j=1:Np
    dx = Pos(:,1)-Pos(j,1);
    dy = Pos(:,2)-Pos(j,2);
    d = sqrt(dx.^2+dy.^2);
    kkk1 = find(d<40);
    kkk2 = find(d>1.5);
    kkk3 = find(ptag>0);
    kkkk = intersect(kkk1,kkk2);
    kkkk = intersect(kkkk,kkk3);
    for jj=1:numel(kkkk)
        if(kkkk(jj)<=100)
            tuple = [j,kkkk(jj)];
            tuple = sort(tuple);
            
            list = [list;tuple-1];
            
        else
            tuple = [j,kkkk(jj)-100];
            tuple = sort(tuple);
            
            list = [list;tuple-1];
            
        end
    end
end
list1 = list;
plot(list1(:,1),list1(:,2),'ro')
hold off
drawnow
end