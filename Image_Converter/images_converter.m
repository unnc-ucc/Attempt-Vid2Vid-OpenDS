function images_converter()   
    function image_gray = a(img)
        %org_name = ['rgb/010',int2str(ind),'.png'];
        i=img;
        [m, n, d] = size(i);
        image_gray = rgb2gray(i);

        

        for a=1:m
             for b=1:n
                if (i(a,b,1)>60 && i(a,b,1)<80)    %convert to sky
                    image_gray(a,b) = 23;
                elseif (i(a,b,1)>0 && i(a,b,1)<65)    %convert to building
                    image_gray(a,b) = 11;
                elseif (i(a,b,1)>136 && i(a,b,1)<150)   %convert to vegetation
                    image_gray(a,b) = 21;
                elseif (i(a,b,1)>128 && i(a,b,1)<135)	%convert to road
                    image_gray(a,b) = 7;
                elseif ((i(a,b,1)>160 && i(a,b,1)<255) || (i(a,b,3)>110 && i(a,b,3)<125))   %convert to sidewalk
                    image_gray(a,b) = 8;
                else
                    image_gray(a,b) = 0;
                end
             end
        end
    end
    

    function main()
        x=zeros(1024,2048);
        x(1:1024,1:2048)=255;

        image_num = 863;
        input_path = 'output'; %folder of input images
        output_path = 'output_night';%output foloder
        mkdir([output_path, '/white']); %generate a folder to store the corresponding white images
        for i=1:image_num
            if(i<10)
                name_org = [input_path,'/sc1_sun_colorLabeled_new00',int2str(i),'.png'];
                img=imread(name_org);
                name = [output_path,'/downtown_00_0000', int2str(i), 'leftImg8bit.png'];
                img1=a(img);

                imwrite(img1,name);
                %generate corresponding white image
                name_white = [output_path,'/white/downtown_00_0000', int2str(i), 'leftImg8bit.png'];
                imwrite(x,name_white);
            elseif(length(int2str(i))==2)

                name_org = [input_path,'/sc1_sun_colorLabeled_new0',int2str(i),'.png'];
                img=imread(name_org);
                name = [output_path,'/downtown_00_000', int2str(i), 'leftImg8bit.png'];
                img1=a(img);
                imwrite(img1,name);
                %generate corresponding white image
                name_white = [output_path,'/white/downtown_00_000', int2str(i), 'leftImg8bit.png'];
                imwrite(x,name_white);
             elseif(length(int2str(i))==3)

                name_org = [input_path,'/sc1_sun_colorLabeled_new',int2str(i),'.png'];
                img=imread(name_org);
                name = [output_path,'/downtown_00_00', int2str(i), 'leftImg8bit.png'];
                img1=a(img);
                imwrite(img1,name);  
                %generate corresponding white image
                name_white = [output_path,'/white/downtown_00_00', int2str(i), 'leftImg8bit.png'];
                imwrite(x,name_white);
            end
        end
    end
        

    main();
end
    