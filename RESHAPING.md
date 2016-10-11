# Reshaping matrices in Octave
### Converting a 2D array into a 1D array such that the rows are appended
message = [a b c; d e f] --> message = [a b c d e f]  
reshape module in octave  
```MATLAB
reshape(matrix,a,b)
```
* no of elements in the matrix should be equal to a\*b
* The result matrix has a rows and b columns
* reshape gives output column wise

```MATLAB
reshape(message,1,6)
```  
Output will be message = [a d b c e f]  
To get desired output, message matrix should be transposed and fed into reshape module

```MATLAB
reshape(message',1,6)
```
Output is message = [a b c d e f]

Therefore matrix a(m,n) into matrix b(1,m*n)
```MATLAB
b = reshape(a',1,m*n)
```

### Converting a 1D array into 2D array row wise
message = [a b c d e f] --> message = [a b c; d e f]  
To get the desired output
```MATLAB
reshape(message,3,2)'
```
should be used

Therefore matrix b(1,m*n) into a(m,n)
```MATLAB
a = reshape(b,n,m)'
```
