# Cambia al directorio de tu repositorio Git
cd "%~dp0"
git add .

# Obtiene el último número correlativo de commit almacenado en el archivo
if [ -f commit_number.txt ]; then
  last_commit_number=$(cat commit_number.txt)
else
  last_commit_number=0
fi
 
# Incrementa el número correlativos
next_commit_number=$((last_commit_number + 1))

# Obtiene la fecha actual en un formato legible
current_date=$(date +"%Y-%m-%d %H:%M:%S")

# Obtiene los cambios realizados en el último commit
commit_changes=$(git log --name-status -1)

# Mensaje de commit con número correlativo, fecha y cambios realizados
commit_message="$next_commit_number | $current_date | $commit_changes"

# Realiza el commit con el nuevo mensaje

git commit -m "$commit_message"

# Guarda el número correlativo actualizado en el archivo
echo "$next_commit_number" > commit_number.txt

# Muestra el mensaje de commit
echo "Nuevo mensaje de commit: $commit_message"

pause