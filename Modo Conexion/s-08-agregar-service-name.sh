# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Shell script que agrega un nuevo service name a tnsname.ora

#Ejecutar como root

cat <<'EOF' >> ${ORACLE_HOME}/network/admin/tnsnames.ora
jamoproy =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-fjg.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVER = SHARED)
      (SERVICE_NAME = jamoproy.fi.unam)
    )
  )
jamoproy_dedicated =
  (DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = pc-fjg.fi.unam)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = jamoproy.fi.unam)
    )
  )
EOF