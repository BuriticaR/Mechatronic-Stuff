clear
clc
z=tf('z');
g1=input('g1: ');
disp(g1);
g2=input('');
disp(g2);
h1=input('');
disp(h1);
G=series(g1,g2);
disp(G);
P=feedback(G,h1);
disp=(P);

