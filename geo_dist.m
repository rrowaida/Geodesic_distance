function [D, R] = geo_dist(st, nd)

  M = model_read_obj('scan_000.obj');
  %M = model_read_obj('bunny.obj');
  Mc = model_connectivity(M);
  V = rows(M.mesh.vertices);
  Max_N = 0;
  for i = 1:V  
    Neib = Mc.viv{i};
    N = rows(Neib);  
    if N > Max_N
      Max_N = N;
    endif  
  endfor
  Mat = zeros(V,Max_N)+(-1);
  for i = 1:V
    Neib = Mc.viv{i};
    N = rows(Neib);
    for j = 1:N
      Mat(i,j) = Neib(j,1);
    endfor
  endfor
  Mat;
  %Sort_Mat = sortrows(Mat);
  Mat2 = zeros(V,V);
  for i = 1:V
    for j = 1:Max_N
      if Mat(i,j) != -1
        temp = M.mesh.vertices(i,:) - M.mesh.vertices(Mat(i,j),:);
        Mat2(i,Mat(i,j)) = temp*temp';
      endif
    endfor
  endfor

  [D, R] = dijkstra(Mat2,st,nd);

end




