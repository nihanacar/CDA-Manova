data food;
   input city & $13. Bread Burger Milk Oranges Tomatoes;
   datalines;
ATLANTA             24.5       94.5     73.9       80.1     41.6
BALTIMORE           26.5       91.0     67.5       74.6     53.3
BOSTON              29.7      100.8     61.4      104.0     59.6
BUFFALO             22.8       86.6     65.3      118.4     51.2
CHICAGO             26.7       86.7     62.7      105.9     51.2
CINCINNATI          25.3      102.5     63.3       99.3     45.6
CLEVELAND           22.8       88.8     52.4      110.9     46.8
DALLAS              23.3       85.5     62.5      117.9     41.8
DETROIT             24.1       93.7     51.5      109.7     52.4
HONALULU            29.3      105.9     80.2      133.2     61.7
HOUSTON             22.3       83.6     67.8      108.6     42.4
KANSAS CITY         26.1       88.9     65.4      100.9     43.2
LOS ANGELES         26.9       89.3     56.2       82.7     38.4
MILWAUKEE           20.3       89.6     53.8      111.8     53.9
MINNEAPOLIS         24.6       92.2     51.9      106.0     50.7
NEW YORK            30.8      110.7     66.0      107.3     62.6
PHILADELPHIA        24.5       92.3     66.7       98.0     61.7
PITTSBURGH          26.2       95.4     60.2      117.1     49.3
ST LOUIS            26.5       92.4     60.8      115.1     46.2
SAN DIEGO           25.5       83.7     57.0       92.8     35.4
SAN FRANCISCO       26.3       87.1     58.3      101.8     41.5
SEATTLE             22.5       77.7     62.0       91.1     44.9
WASHINGTON DC       24.2      93.8      66.0       81.6     46.2
;

proc princomp data=food 
              out=pca_food 
              cov 
              plots=(score(ncomp=2) scree);
  title 'PCA of Food Price Data (covariance matrix)';
  var Bread Burger Milk Oranges Tomatoes;
  id city; 
run;

proc print; run;

proc princomp data=food 
              out=pca_food 
              plots=(score(ncomp=2) scree);
  title 'PCA of Food Price Data (Correlation matrix)';
  var Bread Burger Milk Oranges Tomatoes;
  id city; 
run;

proc sort data=pca_food;
by prin1;
proc print;
 id city;
 var prin1 prin2;
 title2 'Rankings by the First Principal Component (correlation matrix)';
run;
proc sort data=pca_food;
 by prin2;
proc print;
 id city;
 var prin1 prin2;
 title2 'Rankings by the Second Principal Component (correlation matrix)';
run;
