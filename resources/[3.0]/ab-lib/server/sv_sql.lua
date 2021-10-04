SQL = SQL or {}

function Await(pPromise)
    return Citizen.Await(pPromise)
end

SQL.execute = function(query,param)
    local par
    if param == nil then
        par = {}
    else
        par = param
    end
    local psql = promise.new()
    exports["ghmattimysql"]:execute(query,par,function(result)
        psql:resolve(result)
    end)
    return psql
end

SQL.executedynamicparam = function(query, ...)
    local psql = promise.new()
    exports["ghmattimysql"]:execute(query,{...},function(result)
        psql:resolve(result)
    end)
    return psql
end

SQL.scalar = function(query, param)
    local par
    if param == nil then
        par = {}
    else
        par = param
    end
    local psql = promise.new()
    exports["ghmattimysql"]:scalar(query,par,function(result)
        psql:resolve(result)
    end)
    return psql
end

SQL.scalardynamicparam = function(query, ...)
    local psql = promise.new()
    exports["ghmattimysql"]:scalar(query,{...},function(result)
        psql:resolve(result)
    end)
    return psql
end