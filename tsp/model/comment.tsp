enum CommentType {
    comment
}
model CreateCommentInput {
  spot_id: int32;
  user_id: int32;
  type: CommentType;
  content: string;
}

model Comment {
  id: int32;
  content: string;
  created_at: string;
  user_id?: int32;
  user_name?: string;
  user_avatar: string | null;
  type: CommentType;
  spot_id?: int32 | null;
}

model CreateCommentResponse {
  messages?: string;
  data: Comment;
}