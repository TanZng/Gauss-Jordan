def cambiarSiCero(matrix, rows, k):
    ''' Verifica si que pivote no sea cero, si es 0
    cambia las columnas. k es la columna del pivote que es 0
    y la variable iterar es la iteracion de la fila en k'''
    swap = false
    iterar = k + 1
    while i < rows and not swap:
        pivote = matrix[iterar,k] # row, column
        print("pivote: "), pivote
        if pivote != 0:
            swap = true
            matrix.swap_rows(k, iterar)
            #print ("A cambiarSiCero:\n"),a
        iterar = iterar + 1
        #print("iterar en cambiarSiCero: "), iterar
    return a
# - - - - - - G A U S S - - - - - - - -
def gauss(a, inversa=None):
    i = Integer(0) # iterar en columnas
    j = Integer(1) # iterar en renglones
    columna = a.ncols() #Total de columnas
    rows = a.nrows()
    if inversa == None:
        restar = columna - rows
        n = columna - restar
    else:
        n = columna / 2
    #print ("\nM ="), m
    print ("\nN ="), n
    while i < n: #Para dejar el pivote en 1
        # renglon, columna
        pivote = a[i,i]
        if pivote == 0:
            a = cambiarSiCero(a, rows, i)
            #print("matriz a al cambiar:\n"),a
            pivote = a[i,i]
        #print ("\nj ="), j
        a = a.with_row_set_to_multiple_of_row(i, i, 1/pivote) #fi->1/n*fi
        #print ("matrix a:\n"),a
        while j < rows:
            #print("HACER 0")
            # renglon, columna
            y = a[j, i]
            if y != 0:
                #print ("\ny ="), y
                a.add_multiple_of_row(j, i, -y)
                #print ("Matriz A en Gauss:\n"), a
            j = j + 1
        i = i + 1
        j = i + 1
    return a

# - - - - - - G A U S S  -  J O R D A N - - - - - - - -
def gaussJordan(a, inversa=None):
    a = gauss(a)
    i = Integer(0) # itera columnas
    j = Integer(1) # itera renglones
    columna = a.ncols()
    rows = a.nrows()
    if inversa == None:
        restar = columna - rows
        n = columna - restar
    else:
        n = columna / 2
    #print( "\nG A U S S   J O R D A N")
    i = 0 #renglon
    j = i + 1 #columna
    while i < rows:
        while j < n:
            x = a[i,j]
            #print( "\nx = "),x
            a.add_multiple_of_row(i, j, -x)
            #print ("\n"),a
            j = j + 1
        i = i + 1
        j = i + 1
    return a
    
def inversa(a):
    ''' Recibe una matriz CUADRADA "a" para encontrar su inversa'''
    rows = a.nrows()
    II = identity_matrix(rows)
    a = a.augment(II,subdivide=True)
    a = gauss(a, True)
    a = gaussJordan(a, True)
    return a
    
main():
  a = matrix(QQ,3,4,[10,20,50,1600, 30,30,0,1200, 60,50,50,3200]);
  print ("Matriz a:\n"),a
  a = gaussJordan(a)
  print ("Result: \n"), a
  
  a = matrix(QQ,3,3,[1,1,1, 2,1,-3, -1,2,-6]);
  a = inversa(a)
  a

main()
