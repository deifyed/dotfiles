local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('go', {
    s('tbltest', {
        t('func Test'), i(1), t({'(t *testing.T) {',
                '\ttestCases := []struct {',
                    '\t\tname string',
                '\t}{',
                    '\t\t{',
                    '\t\t\tname: "Should ",',
                    '\t\t},',
                '\t}',
                '',
                '\tfor _, tc := range testCases {',
                    '\t\tt.Run(tc.name, func(t *testing.T) {',
                        '\t\t\ttc := tc',
                        '\t\t\tt.Parallel()',
                    '\t\t})',
                '\t}',
            '}',
        }),
    }),
})
