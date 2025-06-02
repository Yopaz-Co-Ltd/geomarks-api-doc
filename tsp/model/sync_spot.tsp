model SpotTranslatedVersion {
  id: int;
  translated_object_id: int;
  translated_object_type: string;
  target_language: string;
  translated_column: string;
  translated_content: Record<string, string>;
}

model SpotMedia {
  id: int;
  order: int;
  comment: string;
  month: array<string>;
  type: string;
  media_url: string;
  thumbnail_url: string;
  path: string;
  translated_versions: array<any>;
}

model TagNameInfo {
  tag_name: string;
  translated_versions: array<any>;
}

model SpotItem {
  id: int;
  uuid: string;
  spot_access_token: string;
  name: string;
  description: string;
  translate_note: string | null;
  type: string;
  checkin_distance: int;
  next_check_in_time: int;
  geo_lat_lng: [float, float];
  tag_slugs: array<string>;
  tag_names: Record<string, TagNameInfo>;
  media_url: string;
  month: array<string>;
  slug: string;
  spot_medias: array<SpotMedia>;
  translated_versions: Record<string, SpotTranslatedVersion>;
}

model SyncSpotResponse {
  current_page: int;
  data: array<SpotItem>;
}