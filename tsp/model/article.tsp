
model Product {
  id: int32;
  status: int32;
  sale_status: int32;
  unlimited: int32;
  amount: int32;
  amount_total_sale: int32;
  price: int32;
  on_sale_start_time: string;
  on_sale_end_time: string;
  user_hold_limit: int32;
}

model Article {
  id: int32;
  uid: string;
  name: string;
  type: int32;
  active: int32;
  description: string;
  seller_pay_gas_fee: int32;
  collection_id: int32;
  can_edit_media: int32;
  created_at: string;
  updated_at: string;
  deleted_at?: string;
  source_media: SourceMedia;
  preview_media: PreviewMedia;
  web3_storage_media: Web3StorageMedia;
  article_obtain_condition: ArticleObtainCondition;
  article_find_conditions: ArticleFindCondition[];
  preview_setting?: string;
  collection: ArticleCollection;
  quest_id: int32;
  product: ArticleProduct;
}

model SourceMedia {
  media_url: string;
  article_uid: string;
  mine_type: string;
  poster_url?: string;
  short_url?: string;
  convert_url?: string;
}

model PreviewMedia {
  media_url: string;
  article_uid: string;
  mine_type: string;
}

model Web3StorageMedia {
  web3_media_uid: string;
  article_uid: string;
  web3_media_cid: string;
}

model ArticleObtainCondition {
  article_uid: string;
  obtain_condition_id: int32;
  data: {
    price: string;
  };
}

model ArticleFindCondition {
  id: int32;
  article_uid: string;
  find_condition_id: int32;
  data: FindConditionData;
  created_at: string;
  updated_at: string;
}

model FindConditionData {
  spot_id?: int32;
  project_uid?: string;
  access_token?: string;
}

model ArticleCollection {
  id: int32;
  name: string;
  smart_contract_address?: string;
}

model ArticleProduct {
  id: int32;
  uid: string;
  model_id: string;
  model_type: string;
  status: int32;
  sale_status: int32;
  unlimited: int32;
  amount: int32;
  amount_total_sale: int32;
  user_hold_limit: int32;
  seller_pay_gas_fee: int32;
  price: int32;
  on_sale_start_time: string;
  on_sale_end_time: string;
  created_at: string;
  updated_at: string;
  deleted_at?: string;
}

model CanBuyArticleResponse {
    messages: string | null;
    data: boolean;
}

model OwnedArticleResponse {
    messages: string | null;
    data: {
        owned_quantity: int32;
    };
}

model LatestArticleResponse {
  messages: string | null;
  data: Record<Article>;
}

model GetArticleByUidResponse {
  messages: string | null;
  data: Article;
}