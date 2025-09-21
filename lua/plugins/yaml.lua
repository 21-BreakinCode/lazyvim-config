return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Ensure yamlls server config exists
      opts.servers = opts.servers or {}
      opts.servers.yamlls = opts.servers.yamlls or {}

      -- Merge CloudFormation custom tags into existing settings
      local yamlls_settings = opts.servers.yamlls.settings or {}
      yamlls_settings.yaml = yamlls_settings.yaml or {}

      -- Add CloudFormation custom tags
      yamlls_settings.yaml.customTags = {
        "!Ref",
        "!GetAtt",
        "!GetAZs",
        "!ImportValue",
        "!Select sequence",
        "!Select",
        "!Split sequence",
        "!Split",
        "!Join sequence",
        "!Join",
        "!Sub",
        "!Transform",
        "!Equals sequence",
        "!Equals",
        "!Not sequence",
        "!Not",
        "!And sequence",
        "!And",
        "!Or sequence",
        "!Or",
        "!If sequence",
        "!If",
        "!Condition",
        "!Base64",
        "!Cidr",
        "!FindInMap sequence",
        "!FindInMap",
        "!GetParam",
        "!Contains sequence",
        "!Contains",
        "!EachMemberEquals sequence",
        "!EachMemberEquals",
        "!EachMemberIn sequence",
        "!EachMemberIn",
        "!ValueOf",
        "!ValueOfAll",
        "!RefAll",
        "!Length",
      }

      -- Disable validation for CloudFormation files
      yamlls_settings.yaml.validate = false
      yamlls_settings.yaml.schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      }

      -- Add CloudFormation schema mappings
      yamlls_settings.yaml.schemas = yamlls_settings.yaml.schemas or {}
      local cfn_schema =
        "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"

      -- Add schema mappings for common CloudFormation file patterns
      yamlls_settings.yaml.schemas[cfn_schema] = {
        "/**/*.yaml",
        "/**/*.yml",
        "/**/*.template*",
      }

      opts.servers.yamlls.settings = yamlls_settings
      return opts
    end,
  },
}

