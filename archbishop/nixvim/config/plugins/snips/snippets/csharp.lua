-- Custom C# snippets for LuaSnip
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

-- Helper function to get filename without extension
local function get_class_name()
	local filename = vim.fn.expand("%:t:r")
	return filename ~= "" and filename or "ClassName"
end

-- 1. CLASS SNIPPET
local class_snippet = s(
	"class",
	fmt(
		[[
public class {1}
{{
    {0}
}}
]],
		{
			f(get_class_name, {}),
			i(0),
		}
	)
)

-- 2. INTERFACE SNIPPET
local interface_snippet = s(
	"interface",
	fmt(
		[[
public interface I{1}
{{
    {0}
}}
]],
		{
			f(get_class_name, {}),
			i(0),
		}
	)
)

-- 3. PROPERTY SNIPPET WITH DIFFERENT TYPES
local property_snippet = s(
	"prop",
	fmt(
		[[
public {1} {2} {{ get; set; }}{0}
]],
		{
			i(0),
			c(1, {
				t("string"),
				t("int"),
				t("bool"),
				t("DateTime"),
				t("decimal"),
				t("object"),
				i(nil, "Type"),
			}),
			i(2, "PropertyName"),
		}
	)
)

-- 4. ASYNC METHOD SNIPPET
local async_method = s(
	"async",
	fmt(
		[[
public async Task{1} {2}({3})
{{
    {0}
}}
]],
		{
			i(0),
			c(1, {
				t(""),
				t("<string>"),
				t("<int>"),
				t("<bool>"),
				i(nil, "<T>"),
			}),
			i(2, "MethodName"),
			i(3, "parameters"),
		}
	)
)

-- 5. CONSTRUCTOR SNIPPET
local constructor_snippet = s(
	"ctor",
	fmt(
		[[
public {1}({2})
{{
    {0}
}}
]],
		{
			i(0),
			f(get_class_name, {}),
			i(2, "parameters"),
		}
	)
)

-- 6. TRY-CATCH SNIPPET
local try_catch = s(
	"try",
	fmt(
		[[
try
{{
    {1}
}}
catch ({2} ex)
{{
    {3}
}}
{0}
]],
		{
			i(0),
			i(1, "// code"),
			c(2, {
				t("Exception"),
				t("ArgumentException"),
				t("InvalidOperationException"),
				t("NotImplementedException"),
			}),
			i(3, "// handle exception"),
		}
	)
)

-- 7. USING SNIPPET
local using_snippet = s(
	"using",
	fmt(
		[[
using ({1} {2} = {3})
{{
    {0}
}}
]],
		{
			i(0),
			c(1, {
				t("var"),
				t("FileStream"),
				t("HttpClient"),
				t("StreamReader"),
			}),
			i(2, "resource"),
			i(3, "new Object()"),
		}
	)
)

-- 8. LINQ SNIPPET
local linq_snippet = s(
	"linq",
	fmt(
		[[
var result = {1}
    .Where({2} => {3})
    .Select({4} => {5}){6};{0}
]],
		{
			i(0),
			i(1, "collection"),
			i(2, "x"),
			i(3, "condition"),
			i(4, "x"),
			i(5, "x.Property"),
			c(6, {
				t(""),
				t(".ToList()"),
				t(".ToArray()"),
				t(".First()"),
				t(".FirstOrDefault()"),
			}),
		}
	)
)

-- 9. ATTRIBUTE SNIPPET
local attribute_snippet = s(
	"attr",
	fmt(
		[[
[{1}({2})]
{0}
]],
		{
			i(0),
			c(1, {
				t("Required"),
				t("StringLength"),
				t("Range"),
				t("EmailAddress"),
				t("Obsolete"),
				i(nil, "AttributeName"),
			}),
			i(2, "parameters"),
		}
	)
)

-- 10. CONSOLE.WRITELINE SNIPPET
local console_snippet = s(
	"cw",
	fmt(
		[[
Console.WriteLine({1});{0}
]],
		{
			i(0),
			c(1, {
				i(nil, '"message"'),
				t('$"Value: {variable}"'),
				i(nil, "variable"),
			}),
		}
	)
)

-- 11. FIELD WITH PROPERTY SNIPPET
local field_property = s(
	"fieldprop",
	fmt(
		[[
private {1} _{2};
public {3} {4}
{{
    get => _{5};
    set => _{6} = value;
}}{0}
]],
		{
			i(0),
			c(1, { t("string"), t("int"), t("bool"), i(nil, "Type") }),
			i(2, "fieldName"),
			f(function(args)
				return args[1]
			end, { 1 }), -- Same type as field
			f(function(args)
				local field = args[1][1] or "fieldName"
				return field:sub(1, 1):upper() .. field:sub(2) -- Capitalize
			end, { 2 }),
			f(function(args)
				return args[1]
			end, { 2 }), -- Same as field name
			f(function(args)
				return args[1]
			end, { 2 }), -- Same as field name
		}
	)
)

-- 12. ENUM SNIPPET
local enum_snippet = s(
	"enum",
	fmt(
		[[
public enum {1}
{{
    {2}
}}{0}
]],
		{
			i(0),
			i(1, "EnumName"),
			i(2, "Value1,\n    Value2"),
		}
	)
)

return {
	class_snippet,
	interface_snippet,
	property_snippet,
	async_method,
	constructor_snippet,
	try_catch,
	using_snippet,
	linq_snippet,
	attribute_snippet,
	console_snippet,
	field_property,
	enum_snippet,
}
