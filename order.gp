/* According to a given atomic order it decides if the second vector is greater than the first one. */
isorder(atomic,u,v)=if(#u<#v,isorder(atomic,concat([0],u),v),if(#u>#v,1-isorder(atomic,v,u),if(#u==0&&#v==0,1,if(u[1]==v[1],isorder(atomic,u[2..#u],v[2..#v]),for(i=1,#atomic,if(atomic[i]==v[1],return(1));if(atomic[i]==u[1],return(0)))))));

/* Decide if the second integer is greater than the first one based on atomic order. */
isorder_int(atomic,x,y)=isorder(atomic,digits(x,#atomic),digits(y,#atomic));

/* Make an ordered vector of integers based on atomic order. */
makeorder_ints(atomic,v)=u0=[];u=v;while(u!=u0,u0=u;for(i=1,#u-1,if( isorder_int(atomic,u[i],u[i+1]),j=u[i];u[i]=u[i+1];u[i+1]=j;kill(j))));u;

/* Fuze two vectors : [[1,2,3],[a,b,c]] -> [1,a,2,b,3,c] */
fuze(u,v)=if(#u<#v,fuze(concat([0],u),v),if(#u>#v,fuze(u,concat([0],v)),vector(2*#u,i,if(i%2==1,u[floor((i-1)/2)+1],v[floor((i-1)/2)+1]))));

/* Fuze n vectors : [[1,2],[a,b],[x,y]] -> [1,a,x,2,b,y] */
fuzen(V)=maxn=vecmax(vector(#V,i,#V[i]));for(i=1,#V,if(#V[i]<maxn,V[i]=concat(vector(maxn-#V[i],j,0),V[i])));v=concat(vector(#V[1],j,vector(#V,i,V[i][j])));for(i=1,#v-1,if(v[i]>0,return(v[i..#v])));

/* Fission fuzed vectors to n pieces : ( [1,-1,2,-2], 2) -> [[1,2],[-1,-2] */
fission(v,n=2)=v=concat(vector(n-#v%n,i,0),v);vector(n,j,vector(#v/n,i,v[((i-1)*n)%(#v+1)+floor(j)]));

/* Fuze n integers */
fuzen_int(V,b=2)=v=fuzen(vector(#V,i,digits(V[i],b)));sum(k=1,#v,b^(k-1)*v[#v-k+1]);

/* Fission fuzed integers */
fission_int(a,b=2,n=2)=V=fission(digits(a,b),n);vector(#V,i,sum(k=1,#V[i],b^(k-1)*V[i][#V[i]-k+1]));

/* Make an ordered vector of complex integers based on atomic order. */
makeorder_comps(atomic,Z)=u=makeorder_ints(atomic,vector(#Z,i,fuzen_int([real(Z[i]),imag(Z[i])])));vector(#Z,i,fission_int(u[i])[1]+fission_int(u[i])[2]*I);