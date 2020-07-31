file1 = 'scan_000_dist.txt';
file2 = 'scan_000_rout.txt';

%file1 = 'test_dist.txt';
%file2 = 'test_rout.txt';
t1 = now();
bnd = model_read_bnd('collected points.txt');

N = rows(bnd);
fid1 = fopen(file1, 'w');
status = 0;
if fid1 == -1
    disp(['ERROR: could not open file "' file1 '"']);
    status = 1;
    return;
end

fid2 = fopen(file2, 'w');
status = 0;
if fid2 == -1
    disp(['ERROR: could not open file "' file2 '"']);
    status = 1;
    return;
end

for i = 1:N
  for j = i+1:N
    t2 = now();
    t2 - t1
    [D,R] = geo_dist(bnd(i,1),bnd(j,1))
    fprintf(fid1, ' %f\n', D);
    print_inx = columns(R);
    for k = 1:print_inx
      fprintf(fid2, ' %d\n', R(1,k));
    endfor
  endfor  
endfor

fclose(fid1);
fclose(fid2);
