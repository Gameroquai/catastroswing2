<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link href="boletines.css" rel="stylesheet" type="text/css"/>
                <title>boletines</title>
            </head>
            <body>

                <xsl:for-each select="//ALUMNO">
                    <xsl:sort select="C_NUMESCOLAR"/>
                    <xsl:variable name="nombreCompleto"
                        select="concat(C_NUMESCOLAR, 'Alumno:', T_APELLIDO1, T_APELLIDO2, T_NOMBRE_ALU)"/>
                    <table border="1">

                        <tr>
                            <th>
                                <xsl:value-of select="$nombreCompleto"/>
                            </th>

                        </tr>
                        <tr>
                            <th class="personal">datos personales</th>

                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li>Dirección:</li>
                                    <li>Localidad:</li>
                                    <li>sexo</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="personal">datos acdemicos</th>
                        </tr>
                        <tr>
                            <th class="notas">notas</th>
                        </tr>
                        <tr>
                            <th class="modulo">modulos</th>
                        </tr>
                        <tr>
                            <th>
                                <select>
                                    <xsl:for-each select="MATERIAS_ALUMNO/MATERIA_ALUMNO">
                                        <option>
                                            <xsl:variable name="codAsig" select="X_MATERIAOMG"/>
                                            <xsl:variable name="nomAsig"
                                                select="//MATERIA[X_MATERIAOMG = $codAsig]/D_MATERIAC"/>

                                            <xsl:variable name="codNota" select="X_CALIFICA"/>
                                            <xsl:variable name="notaAsig"
                                                select="//CALIFICACION[X_CALIFICA = $codNota]/T_ABREV"/>

                                            <xsl:value-of
                                                select="concat(position(), '--', $nomAsig, '-------', $notaAsig)"
                                            />
                                        </option>
                                    </xsl:for-each>
                                </select>
                            </th>
                        </tr>
                    </table>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
