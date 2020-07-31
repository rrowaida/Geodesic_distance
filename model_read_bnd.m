%
% Read an text file and return a list of boundary model structure
%
% function [model, status] = model_read_bnd(filename)
%
% Input -
%   - filename: name of text file to load
%
% Output -
%   - model: list of vertices on the boundary
%   
%
% The function reads the vertices and faces of the mesh, and ignores

%
function [bnd] = model_read_bnd(filename)


    % Open file
    fid = fopen(filename, 'r');

    % Index of current vertex, face, and color to be added
    vindex = 1;
    

    % Initialize data matrices
    bnd = zeros(0, 1);

    % Read content
    while(feof(fid) ~= 1)
        % Read one line
        line = '';
        line = fgetl(fid);
        % A line needs at least two characters to be meaningful
        if length(line) <= 1
            continue;
        end
        % Parse line according to obj format
        % Vertex id        
        line = line(1:length(line));
        bnd(vindex, :) = sscanf(line, '%d');
        vindex = vindex + 1;
    end

    % Close file
    fclose(fid);
end
