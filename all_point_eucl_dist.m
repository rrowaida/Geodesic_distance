file1 = 'scan_000_eucl_dist.txt';
M = model_read_obj('scan_000.obj');
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

for i = 1:N
  for j = i+1:N
    t2 = now();
    t2 - t1;
    D1 = M.mesh.vertices(bnd(i,1),:);
    D2 = M.mesh.vertices(bnd(j,1),:);
    D3 = D1 - D2;
    D = sqrt(D3*D3')
    fprintf(fid1, ' %f\n', D);
  endfor  
endfor

fclose(fid1);

