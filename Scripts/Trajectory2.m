startup_rvc;
clc;
clear all;




%robot setup
L(1)=Link([0 15 0 pi/2 0 -pi/2]);
L(2)=Link([0 0 0 -pi/2 ]);
L(3)=Link([0 20 0 pi/2 ]);
L(4)=Link([0 0 0 -pi/2 0 0]);
L(5)=Link([0 20 0 pi/2]);
L(6)=Link([0 0 0 -pi/2 ]);
L(7)=Link([0 15 0 0 0 pi/2]);



manipulator=SerialLink(L, 'name', 'manipulator');


t=0:.04:2;
q0=[0 0 0 0 0 0 0];
q1=[0 2 2 0 2 0 0];
q2=[0 1.5 2 2 1.5 0 0];


trajec1=jtraj(q0,q1,t); 
trajec2=jtraj(q1,q2,t);
trajec3=jtraj(q2,q0,t);

hold on
tr1=zeros(4,4);

view(-80,80)
xlim([-100,100])
ylim([-100,100])
zlim([-50,100])
for i=1:1:51
    tr1=manipulator.fkine(trajec1(i,:));
    atr1=transpose(tr1);
    atrt1(i,:)=atr1(4,1:3);
    atr1=atrt1;
    plot2(atr1(i,:),'r.')
    manipulator.plot(trajec1(i,:))
    plot2(atrt1,'b')
end
for i=1:1:51
    tr2=manipulator.fkine(trajec2(i,:));
    atr2=transpose(tr2);
    atrt2(i,:)=atr2(4,1:3);
    atr2=atrt2;
    plot2(atr2(i,:),'r.')
    manipulator.plot(trajec2(i,:))
    plot2(atrt2,'b')
end
for i=1:1:51
    tr3=manipulator.fkine(trajec3(i,:));
    atr3=transpose(tr3);
    atrt3(i,:)=atr3(4,1:3);
    atr3=atrt3;
    plot2(atr3(i,:),'r.')
    manipulator.plot(trajec3(i,:))
    plot2(atrt3,'b')
end