model LatestContentResponse {
  messages?: string;
  data: Record<ContentVersion[]>;
}

model CreateTextToSpeechResponse {
  messages?: string;
  data: ContentVersion;
}

model ContentVersion {
  uuid: string;
  owner_object_uuid: string;
  related_object_uuid: string;
  related_object_type: string;
  source_content_version_uuid?: string;
  origin_content_version_uuid?: string;
  content_type: string;           // text hoặc audio
  language: string;
  key: string;
  content: string;
  audio_content?: string;
  version: string;
  metadata: string;
  created_at: string;
  updated_at: string;
  deleted_at?: string;
}