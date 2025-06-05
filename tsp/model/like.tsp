model LikeSpotInput {
  user_id: int32;
  spot_id: int32;
}

model LikeSpotResponse {
  user_id: int32;
  likeable_id: int32;
  likeable_type: string;
  updated_at: string;
  created_at: string;
  id: int32;
}
