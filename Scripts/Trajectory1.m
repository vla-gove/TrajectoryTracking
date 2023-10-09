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
q1=[2.14 2 2 2.14 2 0 0];


trajec1=jtraj(q0,q1,t); 

hold on
tr1=zeros(4,4);

view(-40,40)
xlim([-50,50])
ylim([-50,50])
zlim([0,80])
for i=1:1:51
    tr1=manipulator.fkine(trajec1(i,:));
    atr1=transpose(tr1);
    atrt1(i,:)=atr1(4,1:3);
    atr1=atrt1;
    plot2(atr1(i,:),'r.')
    manipulator.plot(trajec1(i,:))
    plot2(atrt1,'b')
end