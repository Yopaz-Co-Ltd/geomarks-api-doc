import "@typespec/http";

using Http;

@service(#{ title: "Auth API Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@route("/api")

namespace AuthApi {
   model LoginInput {
     email: string;
     password: string;
   }

   model LoginOutput {
       access_token: string;
       expires_in: int32;
       role: string;
       token_type: string;
   }

   model User {
       avatar: string;
       avatar_url: string;
       created_at: string;
       deleted_at: string | null;
       email: string;
       email_verified_at: string | null;
       fbid: string | null;
       id: int32;
       is_admin: int32;
       name: string;
       role: string;
       uid: string | null;
       updated_at: string;
       user_uid: string;
   }

    model EmailInput {
       email: string;
       map_slug: string;
    }

    model StatusOutput {
       status: string;
    }

    @route("/auth")
    @tag("Auth")
    interface auth {
        @route("/login")
        @post()
        login(@body input: LoginInput): LoginOutput;

        @route("/user")
        @useAuth(BearerAuth)
        @get()
        user(): User;
   }

    @route("/users")
    @tag("User Auth")
    interface userAuth {
        @route("/emails")
        @get()
        emails(): string[];

        @route("/forgot-password")
        @post()
        forgotPassword(@body input: EmailInput): StatusOutput;

        @route("/register")
        @get()
        register(@body input: EmailInput): StatusOutput;
   }
}