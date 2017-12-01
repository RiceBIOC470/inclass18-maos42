% In class 18
%GB comments
1.90 using the function imfindcircles, be more strict in your radial dimensions for larger. If I change your parameters to [20 50], the result is much better and you don’t get spurious circles. 
2. 90 more commentary on your results should be provided. 
overall: 95


% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

img=imread('yeast.tif');
imadjust(img);
figure (1); imshow(img); %26-28 circles 

adimg=img>50;
figure (2); imshow(adimg);

iedge=edge(adimg,'canny');
fiedge=imfill(iedge,'holes');
figure (3); imshow(fiedge);

[centers, radii]=imfindcircles(fiedge,[15 21],'Sensitivity',0.95);
figure (4); imshow(img); hold on;
for ii=1:length(centers)
    drawcircle(centers(ii,:),radii(ii),'m');
end


% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

%a)
x=randi(10,1,9);
y=randi(10,1,10);

[issig,pval]=ttest2(x,y);
issig, pval
%they are not significantly different

%b)

x=randi(15,1,10);
y=randi(7,1,20);

[issig,pval]=ttest2(x,y);
issig, pval
% yes

x=randi(14,1,5);
y=randi(20,1,12);

[issig,pval]=ttest2(x,y);
issig, pval
%most of the times no

x=randi(10,1,9);
y=randi(20,1,18);

[issig,pval]=ttest2(x,y);
issig, pval
%yes and no

%c)
for ii=1:100
x=randi(100,1,9);
y=randi(100,1,10);

[issig(ii),pval(ii)]=ttest2(x,y);
end
sum(issig)

%5/100 got a significant value


for ii=1:1000
x=randi(1000,1,9);
y=randi(1000,1,10);

[issig,pval]=ttest2(x,y);
end
sum(issig)

%0 got significant
