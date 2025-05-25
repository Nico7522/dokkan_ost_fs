export const toCamel = (s: string) => {
  return s.replace(/([-_][a-z])/gi, ($1) => {
    return $1.toUpperCase().replace("-", "").replace("_", "");
  });
};

export const keyToCamel = (o: any): any => {
  if (o === Object(o) && !Array.isArray(o) && typeof o !== "function") {
    const n: { [key: string]: any } = {};
    Object.keys(o).forEach((k) => {
      n[toCamel(k)] = keyToCamel(o[k]);
    });
    return n;
  } else if (Array.isArray(o)) {
    return o.map((i) => {
      return keyToCamel(i);
    });
  }
  return o;
};

export const mapToCamel = async <T>(data: T[]): Promise<T[]> => {
  return data.map((d) => keyToCamel(d));
};
