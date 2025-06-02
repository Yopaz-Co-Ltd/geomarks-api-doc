import "@typespec/http";
import "./model/response.tsp";

using Http;

@service(#{ title: "Map API Service" })
@server("https://engine.geomark.yopaz.dev", "DevServer")
@route("/api")

namespace MapApi {
    model MapSettingResponse {
        show_start_screen: float32,
        time_show_start_screen: float32,
        icon_mode_zoom_fit: float32,
        icon_zoom_fit: float32,
        icon_ratio_w: float32,
        icon_ratio_h: float32,
        icon_mode_ratio_w: float32,
        icon_mode_ratio_h: float32,
        location_icon_url: string,
        location_mode_icon_url: string,
        logo_mobile_url: string,
        background_mobile_url: string,
        logo_desktop_url: string,
        background_desktop_url: string,
        logo_url: string | null,
        footer_setting: string | null,
        activity_point_status: int32,
        activity_point_quantity: int32,
        activity_point_time_reset: string,
        activity_point_time_reset_unit: string,
        setting_point_for_spot: int32,
        use_text_to_text: boolean,
        use_text_to_speech: boolean,
        checkin_auto: boolean
    }

    model Map {
        id: int32,
        project_uid: string,
        min_zoom: int32,
        max_zoom: int32,
        default_zoom: int32,
        map_slug: string,
        convert_calculating_type: string,
        max_bounds_br_lat: float32,
        max_bounds_br_lng: float32,
        analytics_tracking_id: int32 | null,
        location_default: string,
        analytics_property_id: int32 | null,
        pusher_app_key: string | null,
        pusher_app_cluster: string | null,
        public: int32,
        project_status: string
    }

    model Thumbnail {
        large: string,
        medium: string,
        small: string,
        tiny: string,
    }

    model MapOption {
        key: int32,
        name: string,
        order: int32,
        tiles_path: string,
        image_url: Record<string>,
        thumbnail: Record<Thumbnail>,
        active: string,
    }

    model MapLevel {
        id: int32,
        zoom_levels: int32[],
        bounds: float32[][],
        center_lat: float32,
        center_lng: float32
    }

    model OpenStreetMap {
        id: int32,
        active: int32,
        only_open_street_map: int32,
        min_zoom: int32,
        max_zoom: int32,
    }

    model BaseDataResponse {
        map: Map,
        map_options: Record<MapOption>,
        toppan_point_title: string,
        toppan_template_point: string,
        map_levels: MapLevel[],
        available_level_marker: Record<int32[]>,
        open_street_map: OpenStreetMap
    }

    @route("/v1.5/maps/{map_slug}")
    @tag("Map")
    interface map {
        @route("/map-setting")
        @get()
        mapSetting(@path map_slug: string): ApiResponse<MapSettingResponse>;

        @route("/base-data")
        @get()
        baseData(@path map_slug: string): ApiResponse<BaseDataResponse>;
    }
}