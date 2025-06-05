import "@typespec/http";
import "./model/spot.tsp";
import "./model/like.tsp";
import "./model/sync_spot.tsp";

using Http;

@service(#{ title: "Spot Api Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@server("https://api-stg.geomark.co.jp", "StagingServer")
@route("/api")

namespace SpotApi {
    @route("/comment")
    @tag("Comment Api")
    @post
    op createComment(
    @body input: CreateCommentInput
    ): CreateCommentResponse;

    @route("/spot/{spot_id}/like")
    @tag("Like Api")
    @post
    op likeSpot(
    @path spot_id: int32,
    @body input: LikeSpotInput
    ): LikeSpotResponse;

    @route("/v1.5/")
    @tag("Spot V1.5 Api")
    interface spotV1 {
        @route("/maps/{map_slug}/spots")
        @get()
        spots(@path map_slug: string): SpotResponse;
        @route("/maps/{map_slug}/spots/have-article")
        @get()
        haveArticle(@path map_slug: string): HaveArticleResponse;
    }

    @route("/v2/spots")
    @tag("Spot V2 Api")
    interface spotV2 {
        @route("/synced-spots")
        @get()
        syncSpot(): SyncSpotResponse;

        @route("/calculating")
        @get()
        calculating(
            @query("conditions[map_id]") map_id: string
        ): CalculatingSpotResponse;

        @route("/tags")
        @get()
        tags(
        @query("map_id") map_id: string,
        ): SpotTagsResponse;

        @route("{spot_id}")
        @get()
        spot(
            @path spot_id: string,
            @query("relationships[]") relationships?: RelationshipType[];
            @query resource?: ResourceType              // resource=frontend
        ): SpotDetailResponse;
    }
}