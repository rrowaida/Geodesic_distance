function [ data ] = proj()

  % load the input dataset
  bnd = model_read_bnd('collected points.txt');
  model = model_read_obj('scan_001.obj');

  num_of_point = rows(bnd);

  geo_dist_arr = model_read_dataset('scan_000_dist.txt');
  eucl_dist_arr = model_read_dataset('scan_000_eucl_dist.txt');
  rows(eucl_dist_arr) 
  %k = 1; 
  %for i = 1:num_of_point
  %  for j = i+1:num_of_point
  %    data(k, 1) = bnd(i,1);
  %    data(k, 2) = bnd(j,1);
  %    data(k,3) = geo_dist_arr(k,1);
  %    data(k,4) = eucl_dist_arr(k,1);
  %    k = k+1;
  %  endfor  
  %endfor
  %data;
  %for i=1:num_of_point
  %  if data(i,3) > data(i,4)
      %display('True');
  %  else
      %display('False');
  %  endif
  %endfor
  
  % Implementation of fast MDS
  %points_ind = model_read_bnd('G_points.txt');
  %updated_distance = zeros(rows(points_ind), rows(points_ind));
  %[a, b] = pivot_select_1(data);
  %for k=1:3
    
    %for n=1:rows(points_ind)
      %x(n,k) = ((find_geo_eucl_dist_points(a, points_ind(n), data))^2 + (find_geo_eucl_dist_points(a, b, data))^2 - (find_geo_eucl_dist_points(b, points_ind(n), data))^2 )/(2*find_geo_eucl_dist_points(a, b, data)); 
    %endfor
       
    %for i=1:rows(points_ind)
      %for j=1:rows(points_ind)
        %dist_data_i_j = find_geo_eucl_dist_points(points_ind(i), points_ind(j), data);
        %updated_distance(i,j) = dist_data_i_j^2 - (x(i,k) - x(j,k))^2;
      %endfor
    %endfor  
   %[max_a, max_b] = pivot_select_2(updated_distance); 
   %a=points_ind(max_a);
   %b=points_ind(max_b);
  %endfor
  %write_output(x);
endfunction
