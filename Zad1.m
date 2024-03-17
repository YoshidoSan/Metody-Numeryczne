w = 0;
s = 2;
while s>1 % funkcja sprawdza czy suma będzie wieksza od 1
	w=w-1;
	s=1+2^w;
end
display(w+1); % najmniejsza potęga dla której suma jest > 1
display(2^(w+1)); % jest to szukana dokładność
