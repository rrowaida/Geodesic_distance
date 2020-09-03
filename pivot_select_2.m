function [max_a, max_b] = pivot_select_2(data)
  row = rows(data);
  col = columns(data);
  max = data(1,1);
  for i=1:row
    for j=1:col
      if max < data(i,j)
        max = data(i,j);
        max_a = i;
        max_b = j;
      endif
     endfor
  endfor
endfunction