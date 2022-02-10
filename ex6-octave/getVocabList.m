function vocabList = getVocabList()
    fid = fopen('vocab.txt');
    n = 1899;  % Total number of words in the dictionary
    vocabList = cell(n, 1);
    for i = 1 : n
        fscanf(fid, '%d', 1);                   % Word Index (can ignore since it will be = i)
        vocabList{i} = fscanf(fid, '%s', 1);    % Actual Word
    end
    fclose(fid);
end
