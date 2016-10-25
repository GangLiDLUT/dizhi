function meaning = getFeatMeaning( token, meaningmat, tokenmat )
%GETFEATMEANING Summary of this function goes here
%   Detailed explanation goes here
    idx= ~cellfun(@isempty,strfind(tokenmat,token));
    meaning = meaningmat{idx};
end

