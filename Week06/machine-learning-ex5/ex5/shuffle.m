## Copyright (C) 2017 Quoc Nguyen
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.


## Author: Quoc Nguyen <quocnb@Quocs-MacBook-Air.local>
## Created: 2017-12-13

function [Xtrain, ytrain, Xval, yval] = shuffle(X, y, train_percent)
	% Shuffle X, y
	Xshuffle = X;
	yshuffle = y;
	m = rows(Xshuffle);
	for i = 1:m
		idx = randperm(m, 1);
		% Swap X_i and X_idx
		temp = Xshuffle(i, :);
		Xshuffle(i, :) = Xshuffle(idx, :);
		Xshuffle(idx, :) = temp;
		
		% Swap y_i and y_idx
		temp = yshuffle(i, :);
		yshuffle(i, :) = yshuffle(idx, :);
		yshuffle(idx, :) = temp;
	end
	
	% Get Xtrain, ytrain, Xval, yval base on percent
	train_rows = floor(m * train_percent);
	Xtrain = Xshuffle(1:train_rows, :);
	ytrain = yshuffle(1:train_rows, :);
	val_rows = train_rows + 1;
	if val_rows < m
		Xval = Xshuffle(val_rows:m, :);
		yval = yshuffle(val_rows:m, :);
	end
	
endfunction
