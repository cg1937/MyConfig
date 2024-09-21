require("orgmode").setup({
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/repos.org",
    org_capture_templates = {
        r = {
            description = "Repo",
            template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
            target = "~/orgfiles/repos.org",
        },
    },
})
