function [a, b] = pivot_select_1(data)
  row = rows(data);
  col = columns(data);
  max = 0;
  for i=1:row
    if data(i, 3) > max
      max = data(i, 3);
      ind = i;
    endif
  endfor
  a=data(ind,1);
  b=data(ind,2);
endfunction
