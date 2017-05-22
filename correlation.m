function carnum=correlation(c)

load Templates 
c=imresize(c,[42 24]);
comp=[ ];
    for n=1:(length(Templates)-1)
        sem=corr2(Templates{1,n},c); %correlation of two images
        comp=[comp sem];
    end
    vd=find(comp==max(comp)); 
  
    %*-*-*-*-*-*-*-*-*-*-*-*-*-
    
    if vd==1 || vd==2
        carnum='A';
    elseif vd==3 || vd==4
        carnum='B';
    elseif vd==5
        carnum='C';
    elseif vd==6 || vd==7
        carnum='D';
    elseif vd==8
        carnum='E';
    elseif vd==9
        carnum='F';
    elseif vd==10
        carnum='G';
    elseif vd==11
        carnum='H';
    elseif vd==12
        carnum='I';
    elseif vd==13
        carnum='J';
    elseif vd==14
        carnum='K';
    elseif vd==15
        carnum='L';
    elseif vd==16
        carnum='M';
    elseif vd==17
        carnum='N';
    elseif vd==18 || vd==19
        carnum='O';
    elseif vd==20 || vd==21
        carnum='P';
    elseif vd==22 || vd==23
        carnum='Q';
    elseif vd==24 || vd==25
        carnum='R';
    elseif vd==26
        carnum='S';
    elseif vd==27
        carnum='T';
    elseif vd==28
        carnum='U';
    elseif vd==29
        carnum='V';
    elseif vd==30
        carnum='W';
    elseif vd==31
        carnum='X';
    elseif vd==32
        carnum='Y';
    elseif vd==33
        carnum='Z';
    %*-*-*-*-*
    
    elseif vd==34
        carnum='1';
    elseif vd==35
        carnum='2';
    elseif vd==36
        carnum='3';
    elseif vd==37 || vd==38
        carnum='4';
    elseif vd==39
        carnum='5';
    elseif vd==40 || vd==41 || vd==42
        carnum='6';
    elseif vd==43
        carnum='7';
    elseif vd==44 || vd==45
        carnum='8';
    elseif vd==46 || vd==47 || vd==48
        carnum='9';
    elseif vd==49 || vd==50
        carnum='0';
    elseif vd==51
        carnum='-';
    end
end


