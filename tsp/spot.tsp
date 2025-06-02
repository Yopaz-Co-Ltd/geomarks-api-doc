import "@typespec/http"
import "./model/spot_v1.tsp"
import "./model/sync_spot.tsp"

using Http;

@service(#{ title: "Spot Api Service" })

namespace SpotApi {
    @route("/v1.5/")
    @tag("Spot V1.5 Api")
    interface spotV1 {
        @route("/map/{map_slug}/spots")
        @get()
        spots(@path map_slug: string): SpotResponse;
    }

    @route("/v2/spots")
    @tag("Spot V2 Api")
    interface spotV2 {
        @route("/synced-spots")
        @get()
        syncSpot(): SyncSpotResponse;

        @route("/calculating")
        @get()
        calculating(): CalculatingSpotResponse;
    }
}