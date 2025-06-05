import "@typespec/http";
import "./model/content_version.tsp";

using Http;

@service(#{ title: "Content version API Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@route("/api/content-versions")
@tag("Content Version Api")
namespace ContentVersionApi {

    @route("/{object_uuid}/latest")
    @get
    op getLatestContentVersion(
    @path object_uuid: string
    ): LatestContentResponse;

    @route("/{content_version_uuid}/text-to-speech")
    @post
    op textToSpeech(
      @path content_version_uuid: string
    ): CreateTextToSpeechResponse;
}
