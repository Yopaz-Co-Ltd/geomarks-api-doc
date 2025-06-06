import "./article.tsp";
import "./comment.tsp";

enum ResourceType {
  frontend,
}

enum RelationshipType {
  product,
}

model Icon {
  link: string | null;
  left_right_flip_link: string | null;
  up_down_flip_link: string | null;
}

model OsmIcon {
  link: string | null;
}

model Tag {
  id: int32;
  tag_name: string;
  tag_slug: string;
}

model LevelMarker {
  id: int32;
  lat: float64;
  lng: float64;
  ref_lat?: float64 | null;
  ref_lng?: float64 | null;
  map_level_id: int32;
  available: int32;
}

model Marker {
  id: int32;
  type: "round" | string;
  size_w: int32;
  size_h: int32;
  icon_anchor_lat: string;
  icon_anchor_lng: string;
  shadow_size_w: int32;
  shadow_size_h: int32;
  icon_social_position_x: int32;
  icon_social_position_y: int32;
  border_color: string;
  icon: Icon;
  osm_icon: OsmIcon;
  level_markers: LevelMarker[];
  moving_stages: unknown[]; // Nếu bạn có schema cụ thể thì thay thế
  route: unknown | null;
  draggable: int32;
  osm_config: unknown | null;
}

model DataItem {
  id: int32;
  type: "sync" | string;
  click_action: string;
  name: string;
  z_index: int32;
  description?: string | null;
  show_sync_icon: int32;
  spot_access_token: string;
  public: int32;
  disable_modal: int32;
  marker: Marker;
  comments: Record<Comment>; // Cần schema cụ thể nếu có
  refer_map?: unknown | null;
  osm_refer_map?: unknown | null;
  refer_map_option_id?: int32 | null;
  geo_lat: float64;
  geo_lng: float64;
  osm_config?: unknown | null;
}

model SpotResponse {
  messages: string;
  data: DataItem[];
}

model HaveArticleResponse {
  messages: string | null;
  data: {
    id: int32;
    spot_access_token: string;
    article_uid: string;
  };
}

//calculating spot
model CalculatingSpotInput {
    map_id: string;
}

model CalculatingSpot {
  id: int32;
  map_id: int32;
  xy: [float, float];
  geo: [float, float];
  marker_id: int32;
}

model CalculatingSpotResponse {
  messages: string | null;
  data: CalculatingSpot[];
}

model SpotTagsResponse {
  messages: string | null;
  data: Tag[];
}

model SpotDetailResponse {
  messages: string | null;
  data: {
    id: int32;
    name: string;
    description: string;
    geo_lat: float64;
    geo_lng: float64;
    spot_access_token: string;
    product: Product;
    article: Article;
  };
}