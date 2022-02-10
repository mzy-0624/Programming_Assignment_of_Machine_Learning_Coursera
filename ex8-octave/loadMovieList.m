function movieList = loadMovieList()
    % GETMOVIELIST reads the fixed movie list in movie.txt and returns a cell array of the words in movieList.
    fid = fopen('movie_ids.txt');               % Read the fixed movieulary list
    % Store all movies in cell array movie{}
    n = 1682;                                   % Total number of movies 
    movieList = cell(n, 1);
    for i = 1 : n
        line = fgets(fid);                      % Read line
        [idx, movieName] = strtok(line, ' ');   % Word Index (can ignore since it will be = i)
        movieList{i} = strtrim(movieName);      % Actual Word
    end
    fclose(fid);
end