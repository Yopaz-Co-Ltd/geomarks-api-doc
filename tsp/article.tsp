import "@typespec/http";
import "./model/article.tsp";

using Http;

@service(#{ title: "Article API Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@route("/api")
@tag("Article Api")

namespace ArticleApi {
    @route("/articles/article-processes/latest-processes")
    @get
    @useAuth(BearerAuth)
    op latestArticles(
        @query("list_article_uid[article_uid]") article_uid: string
    ): LatestArticleResponse;

    @route("/articles/{article_uid}/can-buy-status")
    @get
    @useAuth(BearerAuth)
    op canBuyArticle(
        @path article_uid: string
    ): CanBuyArticleResponse;

    @route("/owned-articles/{article_uid}")
    @get
    @useAuth(BearerAuth)
    op canBuyOwnedArticle(
        @path article_uid: string
    ): OwnedArticleResponse;
    @route("/articles/get-by-uid/{article_uid}")
    @get
    op getArticleByUid(
        @path article_uid: string
    ): GetArticleByUidResponse;
}