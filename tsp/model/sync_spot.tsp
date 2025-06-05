model SpotTranslatedVersion {
  id: int32;
  translated_object_id: int32;
  translated_object_type: string;
  target_language: string;
  translated_column: string;
  translated_content: Record<string>;
}

model SpotMedia {
  id: int32;
  order: int32;
  comment: string;
  month: string[];
  type: string;
  media_url: string;
  thumbnail_url: string;
  path: string;
  translated_versions: unknown[];
}

model TagNameInfo {
  tag_name: string;
  translated_versions: unknown[];
}

model SpotItem {
  id: int32;
  uuid: string;
  spot_access_token: string;
  name: string;
  description: string;
  translate_note: string | null;
  type: string;
  checkin_distance: int32;
  next_check_in_time: int32;
  geo_lat_lng: [float, float];
  tag_slugs: string[];
  tag_names: Record<TagNameInfo>;
  media_url: string;
  month: string[];
  slug: string;
  spot_medias: SpotMedia[];
  translated_versions: Record<SpotTranslatedVersion>;
}

model SyncSpotResponse {
  current_page: int32;
  data: SpotItem[];
}