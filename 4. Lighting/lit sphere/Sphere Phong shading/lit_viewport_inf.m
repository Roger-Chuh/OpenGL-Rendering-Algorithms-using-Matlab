function [ vertex_color ] = lit_viewport_inf( mat_amb_diff, mat_shininess, mat_specular, light_ambient, light_diffuse, light_specular, half_vector, lightsource_dir, vertex_normal)

% >>>>>> Every thing should be normalized before calling this function <<<<<<
% >>>>>> You have to normalize vertex_normal, lightsource_dir, half_vector
% before calling this function

% This function computes the final vetex lighting color
% material diffuse and ambient reflectance are normally the same color
% here we deal with directional light source only
% viewer is assumed to be at infinity
% half vector is precomputed and given to this function to work on it

% VERY IMPORTANT NOTE
% before performing lighting equations the following vectors
%>> light source vector
%>> viewport vector
%>> vertex normal vector
% ALL Should be unit vectors before even calculating the half vector

vertex_color = light_ambient.*mat_amb_diff + (light_diffuse.*mat_amb_diff)*(max(0,dot(vertex_normal,lightsource_dir))) + (light_specular.*mat_specular)*((max(0,dot(half_vector,vertex_normal)))^mat_shininess);
end

