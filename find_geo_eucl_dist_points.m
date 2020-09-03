function [ geo_dist, eucl_dist ] = find_geo_eucl_dist_points(a, b, dataset)
  geo_dist = 0;
  eucl_dist = 0;
  row = rows(dataset);
  for i=1:row
    if (dataset(i,1) == a && dataset(i,2) == b) || (dataset(i,1) == b && dataset(i,2) == a)
      geo_dist = dataset(i,3);
      eucl_dist = dataset(i,4);
    endif
  endfor
endfunction
