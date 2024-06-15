SELECT 
    c.ClienteId AS Codigo,
    c.RazaoSocial,
    c.Email,
    t.NumeroTelefone
FROM 
    Clientes c
JOIN 
    Estados e ON c.CodigoEstado = e.EstadoId
JOIN 
    Telefones t ON c.ClienteId = t.ClienteId
WHERE 
    e.CodigoEstado = 'SP';