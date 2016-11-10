# Setup

1. Create <b>YOUR</b> own repository

2. Run locally `git clone git@github.com:skrypalyk/rspec-showcase.git`

3. Push this app to <b>YOUR</b> repository

# Hometask

## Publish post feature

1. Add boolean column `published` to post (set default value `false`)

2. Add `publish` and `unublish` methods to the `Post` model, which changes `published` column to true or false

3. Add tests for these methods in model spec

4. Add actions `publish` and `unpublish` into PostsController

5. Add tests for these actions

6. Add `user_id` to the params, when calling `publish`/`unpublish` actions. When `user_id` is the same as in `post` object - `post` can be published. If not - user doesn't access to it. Redirect to `root_path` with error message.

7. Open pull request with finished feature. Assign it to me


