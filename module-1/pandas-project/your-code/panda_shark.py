import re
import csv
import pandas as pd

def edades_limpia(age):
    if age.lower() == 'teen':
        age = '18'
    # if  age.lower() == re.compile(r'teen'):
    #     age = '18'
    if  age.lower() == 'young':
        age = '10'
    elif  age == re.compile(r'.young.'):
        age = '10'
    if age.lower() == 'adult':
        age = '40'
    elif  age == re.compile(r'.adult.'):
        age = '40'

    return age



print('\n\n')
sharks = pd.read_csv("./data/GSAF5.csv", header=0, encoding='unicode_escape')


# SACAMOS EL NUMERO DE FILAS Y COLUMNAS DE LA TABLA
print('TAMAÑO DE LA TABLA:')
print('\n ------------------------------------------------------- \n')
size = sharks.shape
print(f'(filas, columnas) = {size}')
print('\n\n ################################################# \n\n')

# IMPRIMIMOS UNA MUESTRA DE CADA COLUMNA CON SUS VALORES
print('COLUMNAS CON MUESTRA DE VALORES:')
print('\n-------------------------------------------------------- \n')
pd.set_option('display.max_columns', 32)
print(sharks.head())
print('\n\n ################################################# \n\n')

# COMPROBAMOS EL NUMERO DE NULOS QUE TIENE CADA COLUMNA
print('NUMERO DE NULOS POR COLUMNA:')
print('\n-------------------------------------------------------- \n')
number_of_null_values = sharks.isnull().sum()
print(number_of_null_values)
print('\n\n ################################################# \n\n')

# ELIMINAMOS LAS COLUMNAS Unnamed: 22 Y Unnamed: 23 PORQUE TIENEN CASI TODOS SUS VALORES NULOS
print('NUMERO DE NULOS POR COLUMNA SIN Unnamed: 22 Y Unnamed: 23:')
print('\n-------------------------------------------------------- \n')
del sharks['Unnamed: 22']
del sharks['Unnamed: 23']
number_of_null_values = sharks.isnull().sum()
print(number_of_null_values)
print('\n\n ################################################# \n\n')

# MIRAMOS EL NOMBRE DE LAS COLUMNAS
print('NOMBRE COLUMNAS:')
print('\n-------------------------------------------------------- \n')
print(sharks.columns.values)
print('\n\n ################################################# \n\n')
# QUITAMOS ESPACIO EN BLANCO DE LAS COLUMNAS
print('NOMBRE COLUMNAS MODIFICADOS:')
print('\n-------------------------------------------------------- \n')
sharks.rename(index=str, columns={'Sex ': 'Sex', 'Species ': 'Species', 'Fatal (Y/N)': 'Fatal(Y/N)'}, inplace=True)
print(sharks.columns.values)
print('\n\n ################################################# \n\n')

# LIMPIAMOS LAS EDADES Y SI NO TIENEN NUMERO
print('EDADES LIMPIAS:')
print('\n-------------------------------------------------------- \n')
sharks.fillna(value='1', inplace=True)
shark_age = sharks['Age'].apply(edades_limpia)
print(shark_age.unique())
print(len(set(shark_age)))
print('\n\n')
print(sharks['Age'].unique())
print(len(set(sharks['Age'])))

print('\n\n ################################################# \n\n')
