const backlinks = {};

export function addLink(from, to) {
  let fromList = backlinks[to];

  if (fromList) {
    fromList.add(from);
  } else {
    backlinks[to] = new Set([from]);
  }
}

export function getBacklinks(to) {
  const bl = backlinks[to];

  if (bl) {
    return [...bl];
  } else {
    return [];
  }
}
