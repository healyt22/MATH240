% Week Four Discussion Script
% Tim Healy

% x + 2y + 3z = 1
% 2x + 4y +7z = 2
% 3x + 7y +11z = 8

% First we set a 3X3 identity matrix to be used to eliminate
	i = eye(3)

% Next, we construct our 3x4 matrix containing our coefficients
	dat = [1, 2, 3, 1; 2, 4, 7, 2; 3, 7, 11, 8]

% First elimination: -2 * 1st row added to the second row, -3 * 1st row added to third row
% Matrix multiplication to eliminate

	elim_1 = i;

	elim_1(2, 1) = -2;
	elim_1(3, 1) = -3;
	elim_1

	dat = elim_1 * dat

% Next we switch rows 2 and 3 in the matrix, and perform second elimination: 
% -2 * 2nd row added to 1st row
% Matrix multiplication to eliminate

	dat2 = dat;
	dat2(2,:) = dat(3,:);
	dat2(3,:) = dat(2,:);

	elim_2 = i;
	elim_2(1, 2) = -2;
	elim_2

	dat2 = elim_2 * dat2

% Lastly we perform our third elimination: add third row to first row, -2 * third row added to
% second
% Matrix multiplication and voila, we have our answer in the matrix dat3

	elim_3 = i;
	elim_3(1, 3) = 1;
	elim_3(2, 3) = -2;
	elim_3

	dat3 = dat2;
	dat3 = elim_3 * dat3
