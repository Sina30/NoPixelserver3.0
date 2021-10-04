ABX.Admin:AddRank("owner", {
    inherits = "dev",
    issuperadmin = true,
    allowafk = true,
    grant = 101
})

ABX.Admin:AddRank("dev", {
    inherits = "spec",
    issuperadmin = true,
    allowafk = true,
    grant = 100
})

ABX.Admin:AddRank("spec", {
    inherits = "admin",
    issuperadmin = true,
    allowafk = true,
    grant = 99
})

ABX.Admin:AddRank("admin", {
    inherits = "moderator",
    allowafk = true,
    isadmin = true,
    grant = 98
})

ABX.Admin:AddRank("moderator", {
    inherits = "trusted",
    isadmin = true,
    grant = 97
})

ABX.Admin:AddRank("trusted", {
    inherits = "user",
    isadmin = true,
    grant = 96
})

ABX.Admin:AddRank("user", {
    inherits = "",
    grant = 1
})