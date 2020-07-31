
input_filename = 'scan_000.obj';
%input_filename = 'bunny.obj';

output_prefix_boundary = 'scan_000_selected_points';
%output_prefix_boundary = 'test_points';

if 1
model = model_read_obj(input_filename);

model = model_connectivity(model);
end

%bnd = model_read_bnd('test_rout.txt');
bnd = model_read_bnd('collected points.txt');

for ind = 1: rows(bnd)
  %bnd_v(ind,:) = model.mesh.vertices(bnd(ind,1), :);
endfor


    model.mesh.FaceVertexCData = ones(size(model.mesh.vertices, 1), 3);
    model.mesh.FaceVertexCData(bnd, :) = repmat([1 0 0], length(bnd), 1);
    model_write_obj(model, [output_prefix_boundary '.obj']);
    model.mesh = rmfield(model.mesh, 'FaceVertexCData');

